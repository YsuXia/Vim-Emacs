#include<iostream>
#include<vector>

#define LOCAL_PARAM_SIZE 10
using namespace std;
typedef struct param{
	string key;
	string value;
	struct param *next;
}param_t;

class SprdParam{
public:
	SprdParam();
	~SprdParam();
private:
	vector<param_t> *local_param;
};

SprdParam::SprdParam(){
	cout<<"Before new vector<param_t>"<<endl;
	local_param = new vector<param_t>(LOCAL_PARAM_SIZE);
	cout<<"After new vector<param_t>"<<endl;
	for(int i = 0; i < LOCAL_PARAM_SIZE; i++){
		cout<<"Before operate local_param->at("<<i<<")"<<endl;
		local_param->at(i).next = NULL;
		local_param->at(i).key = "test";
	}
}

SprdParam::~SprdParam(){
	for(int i = 0; i < LOCAL_PARAM_SIZE; i++)
	{
		cout <<"vector "<<i<<" ="<<local_param->at(i).key<<endl;
	}
}

int main(int argc, char **argv)
{
	cout<<"This is a test!"<<endl;
	SprdParam test;
	cout<<"test over"<<endl;

}
