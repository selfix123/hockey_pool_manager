#include "../include/manager.h"
#include "../include/parsing.h"

static t_err	start_program(int fd)
{
	char	*line = NULL;
	char	*new = NULL;
	char	**file = NULL;
	do
	{
		new = get_next_line(fd);
		if (new)
		{
			line = ft_strfjoin(line, new);
			free(new);
		}
	} while (new);
	file = ft_split(line, '\n');
	if (!file)
		return (m_fail);
	parsing(file);
	return (success);	
}

int	main(int ac, char **av)
{
	int fd = 0;
	int		err;
	if (ac == 2)
	{
		fd = open(av[1], O_RDONLY);
		if (fd < 1)
			return (ft_printf(STDERR_FILENO, "Error\nCannot open file\n"));
		err = start_program(fd);
		if (err < 0)
			return (1);
	}
	else if (ac == 1)
		ft_printf(STDERR_FILENO, "%omissing file after %s\n", NULL, av[0]);
	else
		ft_printf(STDERR_FILENO, "%otoo much files after\n", NULL);
	return (1);
}