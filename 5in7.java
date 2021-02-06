// 英语七选五，胡蒙全错的概率

public class Main {
    static boolean[] vis = new boolean[7];
    static char[] p = new char[7];
    static int[] cnt = new int[6];

    static void dfs(int x) {
        if (x >= 5) {
            int tmp = 0;
            for (int i = 0; i < 5; i++)
                if (i == (int) (p[i] - 'A'))
                    ++tmp;
            ++cnt[tmp];
        } else {
            for (int i = 0; i < 7; i++) {
                if (vis[i])
                    continue;
                vis[i] = true;
                p[x] = (char) ('A' + i);
                dfs(x + 1);
                vis[i] = false;
            }
        }
    }

    public static void main(String[] args) {
        dfs(0);
        int tmp = 0;
        for (int i = 0; i <= 5; i++) {
            tmp += cnt[i];
            System.out.print("蒙对" + i + "题的情况数：");
            System.out.println(cnt[i]);
        }
        System.out.println("总情况数：" + tmp);
    }
}
