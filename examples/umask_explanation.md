# umask Permission Calculations

## 1. Hand‑calculation (digit‑wise subtraction)

For **files** the default mode is `666` (rw‑rw‑rw‑). For **directories** the default is `777` (rwx‑rwx‑rwx‑).  The hand‑calculation subtracts each octal digit of the umask from the corresponding digit of the default mode, never letting a digit go below zero:

```
result_digit = max(0, default_digit – umask_digit)
```

The three resulting digits form the permission octal value.

## 2. Kernel view (bitwise method)

The kernel computes the final permissions by inverting the umask bits and AND‑ing them with the default mode:

```
final_perm = default_mode & (~umask)
```

Because `~umask` (within the 9 permission bits) is equivalent to `777 – umask`, the kernel result is the same as the hand‑calculation above.

## 3. Eight example umasks

| Umask | **Hand‑calc** File (octal) | File (symbolic) | **Hand‑calc** Dir (octal) | Dir (symbolic) |
|-------|---------------------------|-----------------|---------------------------|----------------|
| 022   | 644 | rw‑r‑‑r‑‑ | 755 | rwxr‑x‑r‑x |
| 027   | 640 | rw‑r‑‑‑‑‑ | 750 | rwxr‑x‑--- |
| 007   | 660 | rw‑rw‑‑‑‑ | 770 | rwxrwx--- |
| 002   | 664 | rw‑rw‑r‑‑ | 775 | rwxrwxr‑x |
| 077   | 600 | rw‑------ | 700 | rwx------ |
| 037   | 630 | rw‑‑‑wx--- | 740 | rwxr---- |
| 055   | 611 | rw‑‑x‑‑x | 722 | rwx‑w‑‑w‑ |
| 133   | 533 | r‑‑‑wx‑wx | 644 | rwxr‑‑r‑‑ |

## Detailed calculations

Below are the step‑by‑step calculations for each umask, comparing the hand‑calculation (digit‑wise subtraction) and the kernel view (bitwise XOR and AND) for both files and directories.

### 022

| Step / Method | Hand‑calc (Digit‑wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `666`<br>Default Dir: `777`<br>Umask: `022` | Default File: `666`<br>Default Dir: `777`<br>Inverted Mask: `777 ^ 022 = 755` |
| **File Permissions** | `6‑0=6`, `6‑2=4`, `6‑2=4` → **`644`** (`rw‑r‑‑r‑‑`) | `666 & 755` → **`644`** (`rw‑r‑‑r‑‑`) |
| **Directory Permissions** | `7‑0=7`, `7‑2=5`, `7‑2=5` → **`755`** (`rwxr‑x‑r‑x`) | `777 & 755` → **`755`** (`rwxr‑x‑r‑x`) |

### 027

| Step / Method | Hand‑calc (Digit‑wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `666`<br>Default Dir: `777`<br>Umask: `027` | Default File: `666`<br>Default Dir: `777`<br>Inverted Mask: `777 ^ 027 = 750` |
| **File Permissions** | `6‑0=6`, `6‑2=4`, `6‑7 → 0` → **`640`** (`rw‑r‑‑‑‑‑`) | `666 & 750` → **`640`** (`rw‑r‑‑‑‑‑`) |
| **Directory Permissions** | `7‑0=7`, `7‑2=5`, `7‑7 → 0` → **`750`** (`rwxr‑x‑---`) | `777 & 750` → **`750`** (`rwxr‑x‑---`) |

### 007

| Step / Method | Hand‑calc (Digit‑wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `666`<br>Default Dir: `777`<br>Umask: `007` | Default File: `666`<br>Default Dir: `777`<br>Inverted Mask: `777 ^ 007 = 770` |
| **File Permissions** | `6‑0=6`, `6‑0=6`, `6‑7 → 0` → **`660`** (`rw‑rw‑‑‑‑`) | `666 & 770` → **`660`** (`rw‑rw‑‑‑‑`) |
| **Directory Permissions** | `7‑0=7`, `7‑0=7`, `7‑7 → 0` → **`770`** (`rwxrwx---`) | `777 & 770` → **`770`** (`rwxrwx---`) |

### 002

| Step / Method | Hand‑calc (Digit‑wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `666`<br>Default Dir: `777`<br>Umask: `002` | Default File: `666`<br>Default Dir: `777`<br>Inverted Mask: `777 ^ 002 = 775` |
| **File Permissions** | `6‑0=6`, `6‑0=6`, `6‑2=4` → **`664`** (`rw‑rw‑r‑‑`) | `666 & 775` → **`664`** (`rw‑rw‑r‑‑`) |
| **Directory Permissions** | `7‑0=7`, `7‑0=7`, `7‑2=5` → **`775`** (`rwxrwxr‑x`) | `777 & 775` → **`775`** (`rwxrwxr‑x`) |

### 077

| Step / Method | Hand‑calc (Digit‑wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `666`<br>Default Dir: `777`<br>Umask: `077` | Default File: `666`<br>Default Dir: `777`<br>Inverted Mask: `777 ^ 077 = 700` |
| **File Permissions** | `6‑0=6`, `6‑7 → 0`, `6‑7 → 0` → **`600`** (`rw‑------`) | `666 & 700` → **`600`** (`rw‑------`) |
| **Directory Permissions** | `7‑0=7`, `7‑7 → 0`, `7‑7 → 0` → **`700`** (`rwx------`) | `777 & 700` → **`700`** (`rwx------`) |

### 037

| Step / Method | Hand‑calc (Digit‑wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `666`<br>Default Dir: `777`<br>Umask: `037` | Default File: `666`<br>Default Dir: `777`<br>Inverted Mask: `777 ^ 037 = 740` |
| **File Permissions** | `6‑0=6`, `6‑3=3`, `6‑7 → 0` → **`630`** (`rw‑‑‑wx---`) | `666 & 740` → **`630`** (`rw‑‑‑wx---`) |
| **Directory Permissions** | `7‑0=7`, `7‑3=4`, `7‑7 → 0` → **`740`** (`rwxr----`) | `777 & 740` → **`740`** (`rwxr----`) |

### 055

| Step / Method | Hand‑calc (Digit‑wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `666`<br>Default Dir: `777`<br>Umask: `055` | Default File: `666`<br>Default Dir: `777`<br>Inverted Mask: `777 ^ 055 = 722` |
| **File Permissions** | `6‑0=6`, `6‑5=1`, `6‑5=1` → **`611`** (`rw‑‑x‑‑x`) | `666 & 722` → **`611`** (`rw‑‑x‑‑x`) |
| **Directory Permissions** | `7‑0=7`, `7‑5=2`, `7‑5=2` → **`722`** (`rwx‑w‑‑w‑`) | `777 & 722` → **`722`** (`rwx‑w‑‑w‑`) |

### 133

| Step / Method | Hand‑calc (Digit‑wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `666`<br>Default Dir: `777`<br>Umask: `133` | Default File: `666`<br>Default Dir: `777`<br>Inverted Mask: `777 ^ 133 = 644` |
| **File Permissions** | `6‑1=5`, `6‑3=3`, `6‑3=3` → **`533`** (`r‑‑‑wx‑wx`) | `666 & 644` → **`533`** (`r‑‑‑wx‑wx`) |
| **Directory Permissions** | `7‑1=6`, `7‑3=4`, `7‑3=4` → **`644`** (`rwxr‑‑r‑‑`) | `777 & 644` → **`644`** (`rwxr‑‑r‑‑`) |


## 4. Kernel‑view table (bitwise) – identical to hand‑calc

| Umask | Kernel File (octal) | File (symbolic) | Kernel Dir (octal) | Dir (symbolic) |
|-------|---------------------|-----------------|--------------------|----------------|
| 022   | 644 | rw‑r‑‑r‑‑ | 755 | rwxr‑x‑r‑x |
| 027   | 640 | rw‑r‑‑‑‑‑ | 750 | rwxr‑x‑--- |
| 007   | 660 | rw‑rw‑‑‑‑ | 770 | rwxrwx--- |
| 002   | 664 | rw‑rw‑r‑‑ | 775 | rwxrwxr‑x |
| 077   | 600 | rw‑------ | 700 | rwx------ |
| 037   | 630 | rw‑‑‑wx--- | 740 | rwxr---- |
| 055   | 611 | rw‑‑x‑‑x | 722 | rwx‑w‑‑w‑ |
| 133   | 533 | r‑‑‑wx‑wx | 644 | rwxr‑‑r‑‑ |

Both tables demonstrate that the traditional hand‑calculation yields the same results as the kernel’s bitwise computation.
