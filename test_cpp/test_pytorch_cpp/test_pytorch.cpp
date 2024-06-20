#include<torch/torch.h>
#include<string>
#include<iostream>
using namespace std;
int main(){
  if(torch::mps::is_available()){
	  cout <<  "mps is available"<<endl;
  }else {cout<<"mps chinese";is unavailable"<<endl;}
  return 1;
}
void chinese(){
  int name=123;
  cout<< "name:"+name<<endl;
}
