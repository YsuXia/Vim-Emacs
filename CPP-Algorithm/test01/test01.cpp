#include<iostream>
#include<fstream>
#include<vector>
using namespace std;
static void reading_and_writing_files()
{
	cout<<"enter"<<endl;
	ifstream in("test01.cpp");
	string result;
	string s;
	while(getline(in, result))
		s += result + "\n"; /*result don't store newline charactor*/
	cout<<s;
}
static void vector_using()
{
	vector<string> words;
	cout<<"vector testing"<<endl;
	ifstream in("Makefile");
	string line;
	while(in >> line){
		words.push_back(line);
	}
	for(int i = 0; i < words.size(); i ++){
		cout<<i<<":"<<words[i]<<endl;
	}
}

int main(int argc, char *argv[]){
	int i;
	cout<<"i="<<i<<endl;
	string s1, s2;
	string s3 = "Hello, World";
	string s4("I am");
	s2 = "Today";
	s1 = s3 + " " + s4;
	s1 += "8";
	cout<<"s1= "<<s1<<endl;
	reading_and_writing_files();
	vector_using();
	return 0;
}


