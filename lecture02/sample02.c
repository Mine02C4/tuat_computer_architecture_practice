void swap(int v[], int k)
{
  int tmp;
  tmp = v[k];
  v[k] = v[k+1];
  v[k+1] = tmp;
}
