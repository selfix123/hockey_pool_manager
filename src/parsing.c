#include "../include/parsing.h"

t_err parsing(char **file)
{
	size_t	i = 0;

	while (file[i])
		ft_printf(1, "%s\n", file[i++]);
	return (success);
}
