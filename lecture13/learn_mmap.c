#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <string.h>
#include <stdint.h>

#include <errno.h>
#include <unistd.h>

#include <sys/mman.h>

const size_t dummy_file_size = 1024UL * 1024 * 1024 * 64;

int main() {
  char temp_file_path[] = "/tmp/tcap-temp-XXXXXX";
  int fd = mkstemp(temp_file_path);
  if (fd == -1) {
    fprintf(stderr, "Failed to create temp file. errno = %d\n%s\n", errno, strerror(errno));
    return 1;
  }
  printf("Created temp file at %s\nsize = %zu Bytes\n", temp_file_path, dummy_file_size);
  if (ftruncate(fd, dummy_file_size) == -1)
  {
    fprintf(stderr, "Failed to create temp file. errno = %d\n%s\n", errno, strerror(errno));
    return 1;
  }
  if (unlink(temp_file_path) == -1)
  {
    fprintf(stderr, "Failed to unlink temp file. errno = %d\n%s\n", errno, strerror(errno));
    return 1;
  }
  int page_size = getpagesize();
  size_t map_size = (dummy_file_size / page_size + 1) * page_size;
  printf("page size = %d Bytes\nCalculated map size = %zu Bytes\n", page_size, map_size);
  void *map = mmap(NULL, map_size, PROT_WRITE, MAP_SHARED, fd, 0);
  if (map == MAP_FAILED) {
    fprintf(stderr, "Failed to mmap temp file. errno = %d\n%s\n", errno, strerror(errno));
    return 1;
  }
  printf("Memory mapped HUGE FILE.\n");
  const int write_count = 8;
  for (int i = 0; i < write_count; ++i)
  {
    size_t offset = dummy_file_size / write_count * (i + 1) - 1;
    uint8_t *target_pointer = ((uint8_t *)map) + offset;
    uint8_t value = rand() % 256;
    printf("Target address = %p, offset ~= %zu MiB, write value = %d\n", target_pointer, offset / 1024 / 1024, value);
    *target_pointer = value;
  }
  for (int i = 0; i < write_count; ++i)
  {
    size_t offset = dummy_file_size / write_count * (i + 1) - 1;
    uint8_t *target_pointer = ((uint8_t *)map) + offset;
    printf("Target address = %p, offset ~= %zu MiB, read value = %d\n", target_pointer, offset / 1024 / 1024, *target_pointer);
  }
  munmap(map, map_size);
  return 0;
}
