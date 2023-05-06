function [Labyrinth] = parse_labyrinth(file_path)
	maze_file = fopen(file_path, 'r');
  	nm = fscanf(maze_file, '%d', 2);
  	n = nm(1);
  	m = nm(2);
  	Labyrinth = fscanf(maze_file,  '%d', [m,n])';
  
  
endfunction
