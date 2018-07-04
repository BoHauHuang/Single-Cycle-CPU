#include <iostream>
#include <stdio.h>
#include <math.h>
#include<vector>
#include<cstring>
#include<string>
using namespace std;

const int K = 1024;

double log2(double n){  
    // log(n) / log(2) is log2.
    return log(n) / log(double(2));
}


void simulate(int ways,int cache_size, int block_size, string filename)
{	
	int way = ways;
	int offset_bit = (int)log2(block_size);
	int index_bit = (int)log2(cache_size / block_size);
	int line = 1 << index_bit;
	
	vector<vector<unsigned int> > cache(line);

	unsigned int tag, index, x;
	
    //cout << endl << "cache line: " << line << endl;
		
	const char *fname = filename.c_str();
    char file[20];
    strcpy(file,fname);
    FILE *fp = fopen(file, "r");  // read file
    
	double hit = 0, total = 0, size = 0;
	
	while(fscanf(fp, "%x", &x) != EOF){	
		
    	total++;
		//cout << hex << x << " ";
		index = (x >> offset_bit) & (line - 1);
		//cout << index << endl;
		tag = x >> (index_bit + offset_bit);
		bool got_it = false;
		
		for(int i = 0; i < cache[index].size(); i++){ 
            if(cache[index][i] == tag){ 
                // hit 
                cache[index].erase(cache[index].begin() + i); 
                cache[index].insert(cache[index].begin(), tag); 
                got_it = true; 
                hit++; 
                break; 
            } 
        } 
        // miss
        if(!got_it){ 
            if(cache[index].size() == way){ 
                cache[index].erase(cache[index].begin() + way - 1); 
            } 
            cache[index].insert(cache[index].begin(), tag); 
        }
    }
	
	cout << endl << "Ways: " << ways << "  cache_size: " << cache_size/1024.0 << "K" << "  block_size: " << block_size <<"   miss rate = " << ((total-hit)/total)*100 << "%" << endl;
	fclose(fp);
}
	
int main()
{
	// Let us simulate all
	string ss[] = {"LU.txt", "RADIX.txt"};
	vector<string> fnames(ss, ss+2);
	int i, j;
	for(int fp = 0 ; fp < 2 ; fp++){
		cout << endl << "In file " << fnames[fp] << endl;
		for(j = 0 ; j < 4 ; j++){
			for(i = 0 ; i < 6 ; i++)
			simulate(pow(2, j) ,pow(2, i) * K, 64, fnames[fp]);
			cout << endl;
		}
	}
	
	
}
