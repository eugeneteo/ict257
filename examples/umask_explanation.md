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
