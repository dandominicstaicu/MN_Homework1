function [Link] = get_link_matrix(Labyrinth)

	adj_mat = get_adjacency_matrix(Labyrinth);

	[n, m] = size(adj_mat);
	Link = sparse(n, m);

	for i = 1:n
		non_zero_cnt = nnz(adj_mat(i, :));
		if non_zero_cnt != 0
			Link(i, :) = adj_mat(i, :) / non_zero_cnt;
		endif
	endfor

endfunction