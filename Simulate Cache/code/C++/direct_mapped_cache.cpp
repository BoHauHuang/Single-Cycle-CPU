#include <iostream>
#include <stdio.h>
#include <math.h>
#include<cstring>
#include<string>
#include<vector>
using namespace std;

struct cache_content
{
	bool v;
	unsigned int tag;
    unsigned int data[16];
};

const int K = 1024;

double log2(double n)
{  
    // log(n) / log(2) is log2.
    return log(n) / log(double(2));
}


void simulate(int cache_size, int block_size, string filename)
{
	unsigned int tag, index, x;

	int offset_bit = (int)log2(block_size);
	int index_bit = (int)log2(cache_size / block_size);
	int line = cache_size >> (offset_bit);
	
	cache_content *cache = new cache_content[line];
	
    //cout << "cache line: " << line << endl;

	for(int j = 0; j < line; j++)
		cache[j].v = false;
	
	const char *fname = filename.c_str();
    char file[20];
    strcpy(file,fname);
    FILE *fp = fopen(file, "r");  // read file
    
	double hit = 0, total = 0;
	while(fscanf(fp, "%x", &x) != EOF)
    {	
    	total++;
		//cout << hex << x << " ";
		index = (x >> offset_bit) & (line - 1);
		tag = x >> (index_bit + offset_bit);
		//cout << "Index: " << index << endl;
		if(cache[index].v && cache[index].tag == tag){
			cache[index].v = true;  
			hit++;
		}
			  						// hit
		else
        {	
			cache[index].v = true;  // miss
			cache[index].tag = tag;
		}
	}

	cout <<"cache_size: " << cache_size/1024.0 << "K , block_size: " << block_size <<"  miss rate = " << ((total-hit)/total)*100 << "%" << endl;
	fclose(fp);

	delete [] cache;
}
	
int main(){
	
	// Let us simulate all
	string ss[] = {"DCACHE.txt", "ICACHE.txt"};
	vector<string> fnames(ss, ss+2);
	int i, j;
	for(int fp = 0 ; fp < 2 ; fp++){
		cout << "In file " << fnames[fp] << endl;
		for(i = 1 ; i < 5 ; i++){
			for(j = 0 ; j < 5 ; j++)
			simulate(pow(2,i*2) * K, pow(2,j+4),fnames[fp]);
			cout << endl;
		}
		cout << endl;
	}
	
	
}
