# Lab 03 — Files, Pipes & Text Processing

**Prerequisites:** [File & Directory Operations](../README.md#file--directory-operations) and
[Pipes, Redirection & Text Tools](../README.md#pipes-redirection--text-tools).
**Environment:** any Linux shell.

## Setup

Create a working directory and a sample log file:

```bash
mkdir -p ~/lab03 && cd ~/lab03
cat > access.log <<'EOF'
10.0.0.1 - GET /index.html 200
10.0.0.2 - GET /about.html 200
10.0.0.1 - GET /missing 404
10.0.0.3 - POST /login 200
10.0.0.1 - GET /style.css 200
10.0.0.2 - GET /missing 404
10.0.0.1 - GET /index.html 200
EOF
```

## Objectives

- Move around and inspect files.
- Combine commands with pipes to answer questions about data.

## Tasks

1. Print the full path of your current directory, then list its contents in long format.
2. Show only the **first 3** lines of `access.log`.
3. Count how many total requests (lines) are in the log.
4. Show only the requests that resulted in a `404`.
5. Print just the **IP address** (first column) of every request.
6. Produce a list of each unique IP with a count of how many requests it made, sorted from most to
   least.
7. Save the answer from Task 6 into a new file `top-ips.txt`.
8. Find every file in your home directory whose name ends in `.log`.

## Verify Your Work

- [ ] Task 4 returns exactly 2 lines.
- [ ] Task 6 shows `10.0.0.1` at the top with 4 requests.
- [ ] `cat top-ips.txt` shows the same ranked list.

<details>
<summary><b>Hints / Solution</b></summary>

```bash
# 1
pwd; ls -lah

# 2
head -n 3 access.log

# 3
wc -l access.log

# 4
grep " 404$" access.log

# 5
awk '{print $1}' access.log

# 6
awk '{print $1}' access.log | sort | uniq -c | sort -rn

# 7
awk '{print $1}' access.log | sort | uniq -c | sort -rn > top-ips.txt

# 8
find ~ -name "*.log"
```

</details>
