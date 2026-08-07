#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

int main()
{
	close(0);
	close(1);
	close(2);

	open("/dev/console", O_RDONLY);
	open("/dev/console", O_WRONLY);
	open("/dev/console", O_WRONLY);

	execl("/usr/bin/minicom", "/usr/bin/minicom", 0);
}
