#include<iostream>
#include<hash_map>
#include<string>
#include<map>

using namespace __gnu_cxx;
using namespace std;

void tongji_test()
{
    //海量待统计数据
    char* a[5]={"ab","b","ccc","ab","ccc"};


    //哈希映射统计频率
    hash_map<char *,int> hp;
    for(int i=0;i<5;i++)
    {
        if(hp.find(a[i])!=hp.end())
        {
            hp[a[i]]++;
        }
        else
        {
            hp[a[i]]=1;
        }
    }


    //对字符串按出现频率排序
    multimap<int,char*> m;
    hash_map<char*,int>::iterator it;
    for(it=hp.begin();it!=hp.end();it++)
        m.insert(pair<int,char*>(it->second,it->first));


    //输出出现频率最高的两个字符串
    multimap<int,char*>::iterator t=m.end();    
    for(int i=1;i<=2;i++)
    {
        t--;
        cout<<t->second<<endl;
    }
}

void test02()
{
    map<string, int> dict;
    string s;
    while (cin >> s) {
        ++dict[s];
        if(s == "quit")
        {
            break;
        }
    }


    map<string, int>::iterator it = dict.begin();
    for (; it != dict.end();it++) {
        cout <<it->first << ":" << it->second << endl;
    }

}
int main(void)
{
    test02();
} 
