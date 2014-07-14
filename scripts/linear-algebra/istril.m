## Copyright (C) 2014 Massimiliano Fasi
##
## This file is part of Octave.
##
## Octave is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or (at
## your option) any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {} istril (@var{A})
## Return true if @var{A} is a lower triangular matrix.
##
## A lower triangular matrix has nonzero entries only on the main diagonal
## and below.
## @seealso{istriu, isbanded, isdiag, tril, bandwidth}
## @end deftypefn

## Author: Massimiliano Fasi

function retval = istril (A)

  if (nargin != 1)
    print_usage ();
  endif

  retval = (isnumeric (A) || islogical (A)) && ndims (A) == 2;
  if (retval)
    [i, j] = find (A);
    retval = all (i >= j);
  endif

endfunction


%!assert (! istril ("string"))
%!assert (istril ([]))
%!assert (! istril (zeros (2,2,2)))

%!assert (istril (1))
%!assert (! istril ([1, 1]))
%!assert (istril ([1; 1]))
%!assert (istril (eye (10)))
%!assert (istril (speye (100)))

%!assert (istril (tril (randn (10))))
%!assert (! istril (randn (10)))

%% Test input validation
%!error istril ()
%!error istril (1,2)

