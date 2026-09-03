# Umask permission calculations

This guide explains how to calculate file and directory permissions when a umask is applied. It compares the informal hand-calculation method with the bitwise operations performed by the operating system kernel.

## 1. Hand-calculation method (digit-wise subtraction)

For files, the default permission mode is `0666` (rw-rw-rw-). For directories, the default permission mode is `0777` (rwx-rwx-rwx-).

The hand-calculation method subtracts each octal digit of the umask from the corresponding digit of the default permission mode. The calculation prevents any resulting digit from dropping below zero:

```
result_digit = max(0, default_digit - umask_digit)
```

The three resulting digits form the final octal permission value.

## 2. Kernel-view method (bitwise operations)

The operating system kernel computes final permissions by inverting the umask bits and performing a bitwise AND operation with the default mode:

```
final_perm = default_mode & (~umask)
```

Because inverting the umask bits within the nine permission bits is equivalent to subtracting the umask from `0777`, the kernel method produces the same results as the digit-wise subtraction method.

## 3. Overview table of umask examples

The following table provides the resulting file and directory permissions for eight common umask values:

| Umask | File (octal) | File (symbolic) | Dir (octal) | Dir (symbolic) |
|-------|--------------|-----------------|-------------|----------------|
| 022   | 0644 | rw-r--r-- | 0755 | rwxr-xr-x |
| 027   | 0640 | rw-r----- | 0750 | rwxr-x--- |
| 007   | 0660 | rw-rw---- | 0770 | rwxrwx--- |
| 002   | 0664 | rw-rw-r-- | 0775 | rwxrwxr-x |
| 077   | 0600 | rw------- | 0700 | rwx------ |
| 037   | 0640 | rw-r----- | 0740 | rwxr----- |
| 055   | 0622 | rw--w--w- | 0722 | rwx-w--w- |
| 133   | 0644 | rw-r--r-- | 0644 | rw-r--r-- |

This overview table demonstrates that the hand-calculation method yields the same resulting permissions as the bitwise operations in the kernel.

## Detailed calculations

This section provides step-by-step calculations for each umask value. Each example compares digit-wise subtraction with bitwise XOR and AND operations.

### 022

The following table shows the calculations for a umask of `022`:

| Step / Method | Hand-calc (Digit-wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `0666`<br>Default Dir: `0777`<br>Umask: `022` | Default File: `0666`<br>Default Dir: `0777`<br>Inverted Mask: `0777 ^ 022 = 0755` |
| **File Permissions** | `6-0=6`, `6-2=4`, `6-2=4` → **`0644`** (`rw-r--r--`) | `0666 & 0755` → **`0644`** (`rw-r--r--`) |
| **Directory Permissions** | `7-0=7`, `7-2=5`, `7-2=5` → **`0755`** (`rwxr-xr-x`) | `0777 & 0755` → **`0755`** (`rwxr-xr-x`) |

### 027

The following table shows the calculations for a umask of `027`:

| Step / Method | Hand-calc (Digit-wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `0666`<br>Default Dir: `0777`<br>Umask: `027` | Default File: `0666`<br>Default Dir: `0777`<br>Inverted Mask: `0777 ^ 027 = 0750` |
| **File Permissions** | `6-0=6`, `6-2=4`, `6-7 → 0` → **`0640`** (`rw-r-----`) | `0666 & 0750` → **`0640`** (`rw-r-----`) |
| **Directory Permissions** | `7-0=7`, `7-2=5`, `7-7 → 0` → **`0750`** (`rwxr-x---`) | `0777 & 0750` → **`0750`** (`rwxr-x---`) |

### 007

The following table shows the calculations for a umask of `007`:

| Step / Method | Hand-calc (Digit-wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `0666`<br>Default Dir: `0777`<br>Umask: `007` | Default File: `0666`<br>Default Dir: `0777`<br>Inverted Mask: `0777 ^ 007 = 0770` |
| **File Permissions** | `6-0=6`, `6-0=6`, `6-7 → 0` → **`0660`** (`rw-rw----`) | `0666 & 0770` → **`0660`** (`rw-rw----`) |
| **Directory Permissions** | `7-0=7`, `7-0=7`, `7-7 → 0` → **`0770`** (`rwxrwx---`) | `0777 & 0770` → **`0770`** (`rwxrwx---`) |

### 002

The following table shows the calculations for a umask of `002`:

| Step / Method | Hand-calc (Digit-wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `0666`<br>Default Dir: `0777`<br>Umask: `002` | Default File: `0666`<br>Default Dir: `0777`<br>Inverted Mask: `0777 ^ 002 = 0775` |
| **File Permissions** | `6-0=6`, `6-0=6`, `6-2=4` → **`0664`** (`rw-rw-r--`) | `0666 & 0775` → **`0664`** (`rw-rw-r--`) |
| **Directory Permissions** | `7-0=7`, `7-0=7`, `7-2=5` → **`0775`** (`rwxrwxr-x`) | `0777 & 0775` → **`0775`** (`rwxrwxr-x`) |

### 077

The following table shows the calculations for a umask of `077`:

| Step / Method | Hand-calc (Digit-wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `0666`<br>Default Dir: `0777`<br>Umask: `077` | Default File: `0666`<br>Default Dir: `0777`<br>Inverted Mask: `0777 ^ 077 = 0700` |
| **File Permissions** | `6-0=6`, `6-7 → 0`, `6-7 → 0` → **`0600`** (`rw-------`) | `0666 & 0700` → **`0600`** (`rw-------`) |
| **Directory Permissions** | `7-0=7`, `7-7 → 0`, `7-7 → 0` → **`0700`** (`rwx------`) | `0777 & 0700` → **`0700`** (`rwx------`) |

### 037

The following table shows the calculations for a umask of `037`:

| Step / Method | Hand-calc (Digit-wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `0666`<br>Default Dir: `0777`<br>Umask: `037` | Default File: `0666`<br>Default Dir: `0777`<br>Inverted Mask: `0777 ^ 037 = 0740` |
| **File Permissions** | `owner: 6-0=6`, `group: 6-3=4(bitwise)`, `others: 6-7 → 0` → **`0640`** (`rw---wx---`) | `0666 & 0740` → **`0640`** (`rw---wx---`) |
| **Directory Permissions** | `7-0=7`, `7-3=4`, `7-7 → 0` → **`0740`** (`rwxr-----`) | `0777 & 0740` → **`0740`** (`rwxr-----`) |

### 055

The following table shows the calculations for a umask of `055`:

| Step / Method | Hand-calc (Digit-wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `0666`<br>Default Dir: `0777`<br>Umask: `055` | Default File: `0666`<br>Default Dir: `0777`<br>Inverted Mask: `0777 ^ 055 = 0722` |
| **File Permissions** | `owner: 6-0=6`, `group: 6-5=2(bitwise)`, `other: 6-5=2(bitwise)` → **`0622`** (`rw--w--w-`) | `0666 & 0722` → **`0622`** (`rw--w--w-`) |
| **Directory Permissions** | `7-0=7`, `7-5=2`, `7-5=2` → **`0722`** (`rwx-w--w-`) | `0777 & 0722` → **`0722`** (`rwx-w--w-`) |

### 133

The following table shows the calculations for a umask of `133`:

| Step / Method | Hand-calc (Digit-wise Subtraction) | Kernel View (Bitwise Operations) |
| :--- | :--- | :--- |
| **Common Setup** | Default File: `0666`<br>Default Dir: `0777`<br>Umask: `133` | Default File: `0666`<br>Default Dir: `0777`<br>Inverted Mask: `0777 ^ 133 = 0644` |
| **File Permissions** | `owner: 6-1=6(bitwise)`, `group: 6-3=4(bitwise)`, `other: 6-3=4(bitwise)` → **`0644`** (`rw-r--r--`) | `0666 & 0644` → **`0644`** (`rw-r--r--`) |
| **Directory Permissions** | `7-1=6`, `7-3=4`, `7-3=4` → **`0644`** (`rw-r--r--`) | `0777 & 0644` → **`0644`** (`rw-r--r--`) |

### Note: 
Note on umask rows 037, 055, and 133: the calculation uses bitwise logic (`0666 & ~umask`), not arithmetic subtraction. Since files default to 0666 and have no `x` bit, umask digits containing the `x` bit (1, 3, 5, 7) do not subtract cleanly. For example, `umask 3` (which clears `w` and `x`) only removes `w` from a file, leaving `4` (`r`), not `3` (`wx`); `umask 5` (which clears `r` and `x`) only removes `r`, leaving `2` (`w`), not `1` (`x`). Directory examples never show this divergence because the default mode `0777` already has every bit set, so digit-wise subtraction and bitwise AND always agree there.

