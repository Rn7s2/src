// 根据构造原理推出原子核外电子排布（不处理半满、全满问题等例外情况）

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

// 直接由构造原理推出的能级顺序
const string p = "sspspsdpsdpsfdpsfdpfdf";
const char   dfn[4] = { 's', 'p', 'd', 'f' };
int          cnt[4] = { 0, 1, 2, 3 };


// 定义能级的数据结构，方便排序
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
    // 输入原子序数
    cin >> n;
    bak = n;

    // 按照构造原理，逐能级排电子
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

    // 按照能级先后排序
    sort(v.begin(), v.end());

    // 输出核外电子排布式
    for (int i = 0; i < v.size(); i++) {
	v[i].print();
	cout << ' ';
    }
    cout << endl << "(+" << bak << ") ";

    // 输出各能层电子数
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
