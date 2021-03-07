// In English exams, there's several kinds of questions.
// Assume that you are given an article, and you need to choose 5
// from 7 given sentences to complete the article.
// But you decide to have a wide shot.
// You choose 5 sentences randomly and write them down.
// So will you get the marks?

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
            System.out.print(i + " matching: " + cnt[i] + "\n");
        }
        System.out.println("Total: " + tmp + "\n");
    }
}
