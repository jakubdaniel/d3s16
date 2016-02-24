verbatimtex
%&latex
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}

\begin{document}
etex

input TEX;

filenametemplate "%j%c.mps";

u := 30;

color blue; blue := (0, 176/255, 240/255);
color darkblue; darkblue := (0, 112/255, 192/255);

color red; red := (240/255, 0, 44/255);
color darkred; darkred := (192/255, 0, 28/255);

color green; green := (44/255, 240/255, 0);
color darkgreen; darkgreen := (28/255, 192/255, 0);

color gray; gray := (192/255, 192/255, 192/255);
color darkgray; darkgray := (86/255, 86/255, 86/255);

color orange; orange := (240/255, 176/255, 0);
color darkorange; darkorange := (192/255, 112/255, 0);

color abs; abs := blue;
color darkabs; darkabs := darkblue;

color con; con := orange;
color darkcon; darkcon := darkorange;

color coa; coa := gray;
color darkcoa; darkcoa := darkgray;

def node(expr o, l, ci, cii) =
  begingroup
    picture r;

    r := image(
      fill fullcircle scaled u shifted o withcolor cii;
      draw fullcircle scaled u shifted o withpen pencircle scaled 1.5 withcolor ci;
      label(l, o) withcolor white;
    );

    r
  endgroup
enddef;

def edge(expr o, d, e) =
    begingroup
        save n;
        pair n;
        n := (d - o) rotated 90 / arclength (o -- d);

        ((o .. (.5[o,d] + e * n) .. d) cutbefore (fullcircle scaled (u + 1.5) shifted o) cutafter (fullcircle scaled (u + 1.5) shifted d))
    endgroup
enddef;

numeric n;

n := 5;

pair s[];

for i=1 upto 2 * n:
    s[i] := (2 * i * u, 0);
endfor;

picture p[], all;

p1 := image(
    for i=1 upto n:
        draw node(s[i], btex etex, darkgray, gray);
        drawarrow edge(s[i], s[i+1], 0) withpen pencircle scaled 1.5 withcolor darkgray;
    endfor;
);

p2 := image(
    for i=1 upto n:
        drawarrow edge(s[i], s[i+4], 1.50u) withpen pencircle scaled 1.5 withcolor 0.8white + 0.2darkgray;
    endfor;
    for i=1 upto n:
        drawarrow edge(s[i], s[i+3], 1.25u) withpen pencircle scaled 1.5 withcolor 0.4white + 0.6darkgray;
    endfor;
    for i=1 upto n:
        drawarrow edge(s[i], s[i+2], 1.00u) withpen pencircle scaled 1.5 withcolor 0.0white + 1.0darkgray;
    endfor;
    draw p1;
);

p3 := image(
    color c[];
    for i=1 upto n:
            drawarrow edge(s[i], s[i+4], 1.50u) withpen pencircle scaled 1.5 withcolor gray;
    endfor;
    for i=1 upto n:
        if (i<>1):
            drawarrow edge(s[i], s[i+3], 1.25u) withpen pencircle scaled 1.5 withcolor gray;
        fi;
    endfor;
    for i=1 upto n:
        if (i<>1):
            drawarrow edge(s[i], s[i+2], 1.00u) withpen pencircle scaled 1.5 withcolor gray;
        fi;
    endfor;
    for i=1 upto n:
        if (i<>3):
            drawarrow edge(s[i], s[i+1], 0.00u) withpen pencircle scaled 1.5 withcolor gray;
        fi;
    endfor;
    drawarrow edge(s3, s4, 0.00u) withpen pencircle scaled 1.5 withcolor darkred;
    drawarrow edge(s1, s3, 1.00u) withpen pencircle scaled 1.5 withcolor darkred;
    drawarrow edge(s1, s4, 1.25u) withpen pencircle scaled 1.5 withcolor darkred;
    for i=1 upto n:
        if (i=1) or (i=3) or (i=4):
            c1:=darkred;
            c2:=red;
        else:
            c1:=gray;
            c2:=0.4white + 0.6gray;
        fi;
        draw node(s[i], btex etex, c1, c2);
        if (i=1) or (i=3) or (i=4):
            label(btex $f$ etex xscaled 1.5, s[i]) withcolor white;
        fi;
    endfor;
);

p4 := image(
    for i=1 upto n:
        drawarrow edge(s[i], s[i+4], 1.50u) withpen pencircle scaled 1.5 withcolor 0.8white + 0.2darkred;
    endfor;
    for i=1 upto n:
        drawarrow edge(s[i], s[i+3], 1.25u) withpen pencircle scaled 1.5 withcolor 0.4white + 0.6darkred;
    endfor;
    for i=1 upto n:
        drawarrow edge(s[i], s[i+2], 1.00u) withpen pencircle scaled 1.5 withcolor 0.0white + 1.0darkred;
    endfor;
    for i=1 upto n:
        draw node(s[i], btex etex, darkred, red);
        label(btex $f$ etex xscaled 1.5, s[i]) withcolor white;
        drawarrow edge(s[i], s[i+1], 0) withpen pencircle scaled 1.5 withcolor darkred;
    endfor;
);

p5 := image(
    for i=1 upto n:
        draw edge(s[i], s[i+4], 1.50u) withpen pencircle scaled 1.5 withcolor 0.8white + 0.2darkred;
    endfor;
    for i=1 upto n:
        draw edge(s[i], s[i+3], 1.25u) withpen pencircle scaled 1.5 withcolor 0.4white + 0.6darkred;
    endfor;
    for i=1 upto n:
        draw edge(s[i], s[i+2], 1.00u) withpen pencircle scaled 1.5 withcolor 0.0white + 1.0darkred;
    endfor;
    for i=1 upto n:
        draw node(s[i], btex etex, darkred, red);
        label(btex $f$ etex xscaled 1.5, s[i]) withcolor white;
        draw edge(s[i], s[i+1], 0) withpen pencircle scaled 1.5 withcolor darkred;
    endfor;
);

p6 := image(
    for i=1 upto n:
        if (i=3):
            drawarrow edge(s[i], s[i+1], 0) withpen pencircle scaled 1.5 withcolor darkred;
        elseif (i<>n):
            drawarrow edge(s[i], s[i+1], 0) withpen pencircle scaled 1.5 withcolor darkgray;
        fi;
    endfor;
    for i=1 upto n:
        if (i=3) or (i=4):
            draw node(s[i], btex etex, darkred, red);
        else:
            draw node(s[i], btex etex, darkgray, gray);
        fi;
    endfor;
    drawarrow edge(s5, s2, -1.25u) withpen pencircle scaled 1.5 withcolor darkgray;
);

p7 := image(
    for i=1 upto n:
        if (i=3):
            drawarrow edge(s[i], s[i+1], 0) withpen pencircle scaled 1.5 withcolor darkred;
        elseif (i=4):
            drawarrow edge(s[i], s[i+1], 0) withpen pencircle scaled 1.5 withcolor 0.5white + 0.5darkgray;
        elseif (i<>n):
            drawarrow edge(s[i], s[i+1], 0) withpen pencircle scaled 1.5 withcolor darkgray;
        fi;
        if (i=3) or (i=4):
            draw node(s[i], btex etex, darkred, red);
        elseif (i=5):
            draw node(s[i], btex etex, 0.5white + 0.5darkgray, 0.5white + 0.5gray);
        else:
            draw node(s[i], btex etex, darkgray, gray);
        fi;
    endfor;
    drawarrow edge(s[n], s[n+1], 0) withpen pencircle scaled 1.5 withcolor 0.5white + 0.5darkgray;
);

all := image(
    for i=1 upto 6:
        draw p[i];
    endfor;
);

beginfig(1)
  draw p1;

  setbounds currentpicture to bbox(all);
endfig;

beginfig(2)
  draw p2;

  setbounds currentpicture to bbox(all);
endfig;

beginfig(3)
  draw p3;

  setbounds currentpicture to bbox(all);
endfig;

beginfig(4)
  draw p4;

  setbounds currentpicture to bbox(all);
endfig;

beginfig(5)
  draw p5;

  setbounds currentpicture to bbox(all);
endfig;

beginfig(6)
  draw p6;
endfig;

beginfig(7)
    pair n[];

    n0 := (0u, 0u);

    draw node(n0, btex etex, darkgray, gray);

    drawarrow edge(n0, n0 + (0.1, 0), 1u) withpen pencircle scaled 1.5 withcolor darkgray;
    drawarrow edge(n0 - (1.5u, 0), n0, 0) withpen pencircle scaled 1.5 withcolor darkgray;
    drawarrow (edge(n0, n0 - (0.1, 0), -1u) rotated 180) withpen pencircle scaled 1.5 withcolor darkgray;

    label.top(btex $\begin{array}{c} \mathbf{x < 10} \\ \mathbf{x' = x + 1}\end{array}$ etex, n0 + (0, 1u)) withcolor darkgray;
    label.bot(btex $\begin{array}{c} \mathbf{x' = x}\end{array}$ etex, n0 - (0, 1u)) withcolor darkgray;
endfig;

beginfig(8)
    draw p7;
endfig;

beginfig(9)
    drawarrow edge(s3, s5, 1u) withpen pencircle scaled 1.5 withcolor darkred;
    label.top(btex $\tau \in \bigcup\Phi$ etex scaled 1.2, .5[s3, s5] + (0u, 1u)) withcolor darkred;
    for i=1 upto n:
        drawarrow edge(s[i], s[i+1], 0) withpen pencircle scaled 1.5 withcolor darkgray;
        if (i=3):
            draw node(s[i], btex $X_{i_1}$ etex, darkred, red);
        elseif (i=5):
            draw node(s[i], btex $X_{i_2}$ etex, darkred, red);
        else:
            draw node(s[i], btex etex, darkgray, gray);
        fi;
    endfor;
endfig;

beginfig(10)
    for i=1 upto n:
        drawarrow edge(s[i], s[i+1], 0) withpen pencircle scaled 1.5 withcolor darkgray;
        if (i=3):
            draw node(s[i], btex $X_c := X$ etex scaled 0.6, darkred, red);
        elseif (i=5):
            draw node(s[i], btex $\Phi(X_c, X)$ etex scaled 0.6, darkred, red);
        else:
            draw node(s[i], btex etex, darkgray, gray);
        fi;
    endfor;
endfig;

end

verbatimtex
\end{document}
etex

.
