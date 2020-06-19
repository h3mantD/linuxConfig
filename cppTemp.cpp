
/* Created by h3mantD */

#include<bits/stdc++.h>
//printing and scanning statements...
#define deb(x) cout << #x << "=" << x << "\n"
#define deb2(x, y) cout << #x << "=" << x << "," << #y << "=" << y << "\n"

#define pi(x)	printf("%d\n",x)
#define pl(x)	printf("%lld\n",x)
#define ps(s)	printf("%s\n",s)

#define si(x)	scanf("%d",&x)
#define sl(x)	scanf("%lld",&x)
#define ss(s)	scanf("%s",s)

//declarations
#define ll long long
#define pb push_back
#define all(x) x.begin(), x.end()
#define PI 3.1415926535897932384626

typedef pair<int, int>	pii;
typedef pair<ll, ll>	pl;

typedef vector<int>		vi;
typedef vector<ll>		vl;
typedef vector<pii>		vpii;
typedef vector<pl>		vpl;
typedef vector<vi>		vvi;
typedef vector<vl>		vvl;


//loops
#define fo(i,n) for(int i=0; i<n; i++)
#define tr(it, a) for(auto it = a.begin(); it != a.end(); it++)

using namespace std;

/*-----------------------------------------------------------------------------------------------*/

const int mod = 1'000'000'007;
const int N = 3e5, M = N;

vi g[N];
int a[N];

int mpow(int base, int exp); 
void ipgraph(int n, int m);



//================================================================================================//

void solve() {
  int i, j, n, m;
  
  /*
  	Write your code here
  */
  
}

int main() {
    ios_base::sync_with_stdio(0), cin.tie(0), cout.tie(0);
    srand(chrono::high_resolution_clock::now().time_since_epoch().count());

    int t = 1;
    cin >> t;
    while(t--) {
      solve();
    }

    return 0;
}

void ipgraph(int n, int m){
    int i, u, v;
    while(m--){
        cin>>u>>v;
        u--, v--;
        g[u].pb(v);
        g[v].pb(u);
	}
}

int mpow(int base, int exp) {
    base %= mod;
    int result = 1;
    while (exp > 0) {
        if (exp & 1) result = ((ll)result * base) % mod;
        base = ((ll)base * base) % mod;
        exp >>= 1;
    }
    return result;
}


