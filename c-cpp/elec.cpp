// Calculates electrons outside the core of an atom.

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

// pre-defined 'constuction principle'
const string p = "sspspsdpsdpsfdpsfdpfdf";
const char   dfn[4] = { 's', 'p', 'd', 'f' };
int          cnt[4] = { 0, 1, 2, 3 };


// to make sorting easier, define a struct
struct EnergyStage {
    int idx;
    int stg;
    int elc;

    EnergyStage(int idx, int stg, int elc) {
	this->idx = idx;
	this->stg = stg;
	this->elc = elc;
    }

    void print() {
	cout << idx << dfn[stg] << elc;
    }

    bool operator < (const EnergyStage& b) const {
	if (idx == b.idx)
	    return stg < b.stg;
	else
	    return idx < b.idx;
    }
};

vector<EnergyStage> v;

int main()
{
    int n, tmp, bak;
    // input the atomic number
    cin >> n;
    bak = n;

    // push electrons into each energy stage
    for (int i = 0; i < p.size() && n > 0; ++i) {
	switch (p[i]) {
	case 's':
	    tmp = n >= 2 ? 2 : n;
	    n -= tmp;
	    v.push_back(EnergyStage(++cnt[0], 0, tmp));
	    break;
	case 'p':
	    tmp = n >= 6 ? 6 : n;
	    n -= tmp;
	    v.push_back(EnergyStage(++cnt[1], 1, tmp));
	    break;
	case 'd':
	    tmp = n >= 10 ? 10 : n;
	    n -= tmp;
	    v.push_back(EnergyStage(++cnt[2], 2, tmp));
	    break;
	default:
	    tmp = n >= 14 ? 14 : n;
	    n -= tmp;
	    v.push_back(EnergyStage(++cnt[3], 3, tmp));
	}
    }
    
    sort(v.begin(), v.end());

    for (int i = 0; i < v.size(); i++) {
	v[i].print();
	cout << ' ';
    }
    cout << endl << "(+" << bak << ") ";

    int lst = 0, cur = 0, sum = 0;
    for (int i = 0; i < v.size(); i++) {
	cur = v[i].idx;
	if (lst != cur && lst) {
	    cout << sum << ") ";
	    sum = 0;
	}
	sum += v[i].elc;
	lst = cur;
    }
    cout << sum << ')' << endl;

    return 0;
}
