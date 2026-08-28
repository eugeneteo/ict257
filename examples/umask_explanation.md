# umask Permission Calculations

## 1. Hand‑calculation (digit‑wise subtraction)

For **files** the default mode is `0666` (rw‑rw‑rw‑). For **directories** the default is `0777` (rwx‑rwx‑rwx‑).  The hand‑calculation subtracts each octal digit of the umask from the corresponding digit of the default mode, never letting a digit go below zero:

```
result_digit = max(0, default_digit – umask_digit)
```

The three resulting digits form the permission octal value.

## 2. Kernel view (bitwise method)

The kernel computes the final permissions by inverting the umask bits and AND‑ing them with the default mode:

```
final_perm = default_mode & (~umask)
```

Because `~umask` (within the 9 permission bits) is equivalent to `0777 – umask`, the kernel result is the same as the hand‑calculation above.

## 3. Eight example umasks

| Umask | **Hand‑calc** File (octal) | File (symbolic) | **Hand‑calc** Dir (octal) | Dir (symbolic) |
|-------|---------------------------|-----------------|---------------------------|----------------|
| 022   | 0644 | rw‑r‑‑r‑‑ | 0755 | rwxr‑x‑r‑x |
| 027   | 0640 | rw‑r‑‑‑‑‑ | 0750 | rwxr‑x‑--- |
| 007   | 0660 | rw‑rw‑‑‑‑ | 0770 | rwxrwx--- |
| 002   | 0664 | rw‑rw‑r‑‑ | 0775 | rwxrwxr‑x |
| 077   | 0600 | rw‑------ | 0700 | rwx------ |
| 037   | 0630 | rw‑‑‑wx--- | 0740 | rwxr---- |
| 055   | 0611 | rw‑‑x‑‑x | 0722 | rwx‑w‑‑w‑ |
| 133   | 0533 | r‑‑‑wx‑wx | 0644 | rwxr‑‑r‑‑ |

## Detailed calculations


Below are the step‑by‑step calculations for each umask, comparing the hand‑calculation (digit‑wise subtraction) and the kernel view (bitwise XOR and AND) for both files and directories.

### 022

| Step / Method | Hand‑calc (Digit‑wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `0666`<br>Default Dir: `0777`<br>Umask: `022` | Default File: `0666`<br>Default Dir: `0777`<br>Inverted Mask: `0777 ^ 022 = 0755` |
| **File Permissions** | `6‑0=6`, `6‑2=4`, `6‑2=4` → **`0644`** (`rw‑r‑‑r‑‑`) | `0666 & 0755` → **`0644`** (`rw‑r‑‑r‑‑`) |
| **Directory Permissions** | `7‑0=7`, `7‑2=5`, `7‑2=5` → **`0755`** (`rwxr‑x‑r‑x`) | `0777 & 0755` → **`0755`** (`rwxr‑x‑r‑x`) |

### 027

| Step / Method | Hand‑calc (Digit‑wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `0666`<br>Default Dir: `0777`<br>Umask: `027` | Default File: `0666`<br>Default Dir: `0777`<br>Inverted Mask: `0777 ^ 027 = 0750` |
| **File Permissions** | `6‑0=6`, `6‑2=4`, `6‑7 → 0` → **`0640`** (`rw‑r‑‑‑‑‑`) | `0666 & 0750` → **`0640`** (`rw‑r‑‑‑‑‑`) |
| **Directory Permissions** | `7‑0=7`, `7‑2=5`, `7‑7 → 0` → **`0750`** (`rwxr‑x‑---`) | `0777 & 0750` → **`0750`** (`rwxr‑x‑---`) |

### 007

| Step / Method | Hand‑calc (Digit‑wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `0666`<br>Default Dir: `0777`<br>Umask: `007` | Default File: `0666`<br>Default Dir: `0777`<br>Inverted Mask: `0777 ^ 007 = 0770` |
| **File Permissions** | `6‑0=6`, `6‑0=6`, `6‑7 → 0` → **`0660`** (`rw‑rw‑‑‑‑`) | `0666 & 0770` → **`0660`** (`rw‑rw‑‑‑‑`) |
| **Directory Permissions** | `7‑0=7`, `7‑0=7`, `7‑7 → 0` → **`0770`** (`rwxrwx---`) | `0777 & 0770` → **`0770`** (`rwxrwx---`) |

### 002

| Step / Method | Hand‑calc (Digit‑wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `0666`<br>Default Dir: `0777`<br>Umask: `002` | Default File: `0666`<br>Default Dir: `0777`<br>Inverted Mask: `0777 ^ 002 = 0775` |
| **File Permissions** | `6‑0=6`, `6‑0=6`, `6‑2=4` → **`0664`** (`rw‑rw‑r‑‑`) | `0666 & 0775` → **`0664`** (`rw‑rw‑r‑‑`) |
| **Directory Permissions** | `7‑0=7`, `7‑0=7`, `7‑2=5` → **`0775`** (`rwxrwxr‑x`) | `0777 & 0775` → **`0775`** (`rwxrwxr‑x`) |

### 077

| Step / Method | Hand‑calc (Digit‑wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `0666`<br>Default Dir: `0777`<br>Umask: `077` | Default File: `0666`<br>Default Dir: `0777`<br>Inverted Mask: `0777 ^ 077 = 0700` |
| **File Permissions** | `6‑0=6`, `6‑7 → 0`, `6‑7 → 0` → **`0600`** (`rw‑------`) | `0666 & 0700` → **`0600`** (`rw‑------`) |
| **Directory Permissions** | `7‑0=7`, `7‑7 → 0`, `7‑7 → 0` → **`0700`** (`rwx------`) | `0777 & 0700` → **`0700`** (`rwx------`) |

### 037

| Step / Method | Hand‑calc (Digit‑wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `0666`<br>Default Dir: `0777`<br>Umask: `037` | Default File: `0666`<br>Default Dir: `0777`<br>Inverted Mask: `0777 ^ 037 = 0740` |
| **File Permissions** | `6‑0=6`, `6‑3=3`, `6‑7 → 0` → **`0630`** (`rw‑‑‑wx---`) | `0666 & 0740` → **`0630`** (`rw‑‑‑wx---`) |
| **Directory Permissions** | `7‑0=7`, `7‑3=4`, `7‑7 → 0` → **`0740`** (`rwxr----`) | `0777 & 0740` → **`0740`** (`rwxr----`) |

### 055

| Step / Method | Hand‑calc (Digit‑wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `0666`<br>Default Dir: `0777`<br>Umask: `055` | Default File: `0666`<br>Default Dir: `0777`<br>Inverted Mask: `0777 ^ 055 = 0722` |
| **File Permissions** | `6‑0=6`, `6‑5=1`, `6‑5=1` → **`0611`** (`rw‑‑x‑‑x`) | `0666 & 0722` → **`0611`** (`rw‑‑x‑‑x`) |
| **Directory Permissions** | `7‑0=7`, `7‑5=2`, `7‑5=2` → **`0722`** (`rwx‑w‑‑w‑`) | `0777 & 0722` → **`0722`** (`rwx‑w‑‑w‑`) |

### 133

| Step / Method | Hand‑calc (Digit‑wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `0666`<br>Default Dir: `0777`<br>Umask: `133` | Default File: `0666`<br>Default Dir: `0777`<br>Inverted Mask: `0777 ^ 133 = 0644` |
| **File Permissions** | `6‑1=5`, `6‑3=3`, `6‑3=3` → **`0533`** (`r‑‑‑wx‑wx`) | `0666 & 0644` → **`0533`** (`r‑‑‑wx‑wx`) |
| **Directory Permissions** | `7‑1=6`, `7‑3=4`, `7‑3=4` → **`0644`** (`rwxr‑‑r‑‑`) | `0777 & 0644` → **`0644`** (`rwxr‑‑r‑‑`) |


This overview table demonstrates that the traditional hand‑calculation yields the identical resulting permissions as the kernel’s bitwise computation.

