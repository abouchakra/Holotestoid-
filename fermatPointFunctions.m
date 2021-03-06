(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



Fermat's Point


Needs["SmallFunctions`"]


BeginPackage["FermatPointFunctions`"]


Unprotect["`*"];ClearAll["`*"];
(*unprotect and clear out old definitionsn-allows repeated loading and alterations*)


FermatPointFunctions::usage="This package is where all the fermat's point functions are stored.";


EquilateralTriangle::usage="finds the perpendicular slope based on the midpoint, finds the third point of the equilateral triangle";


FindCorrectTriangleSide::usage="finds the equilateral triangle oposite from vertex point";


MainEquilateralFn::usage="Finds Three equilateral triangles around one triangle";


LineMatrixEqn::usage="returns a list with  {-1/m, 1 (y coef), b}"


Getdet::usage="gets determinant";


Getdetx1::usage="gets determinant for x";


Getdety2::usage="gets determinant for y";


GetFermatPoint::usage="gets fermat point given 3 centers";


Begin["`Private`"]


EquilateralTriangle[pt5_,pt6_]:= Map[Function[dummy,((pt5+pt6)/2)-(Sqrt[3]/2)*(dummy)],SmallFunctions`SlopePerpDirection[pt6, pt5]]


FindCorrectTriangleSide[vertexList_]:=
If[(SmallFunctions`DistancebtwPoints[vertexList[[1]], vertexList[[2,1]]])>SmallFunctions`DistancebtwPoints[ vertexList[[1]], vertexList[[2,2]]], vertexList[[2,1]], vertexList[[2,2]]]


MainEquilateralFn[tripts_]:=Module[{equiTri},
equiTri= Map[Function[dummy, {dummy[[1]],N[ EquilateralTriangle[ dummy[[2]],dummy[[3]]]]}], tripts];
Map[Function[dummy, {dummy[[1]],FindCorrectTriangleSide[dummy]}],equiTri]
]


LineMatrixEqn[pt1_, pt2_]:= If[(pt1[[1]]-pt2[[1]]) == 0,{1,0, pt1[[1]]},{-((pt1[[2]]-pt2[[2]])/(pt1[[1]]-pt2[[1]])), 1,(pt1[[2]] - (((pt1[[2]]-pt2[[2]])/(pt1[[1]]-pt2[[1]]))*pt1[[1]]))}
]


Getdet[matrow_]:= Take[matrow, 2]
Getdetx1[matrow_]:= {matrow[[Length[matrow]]],matrow[[2]]}
Getdety2[matrow_]:= {matrow[[1]],matrow[[Length[matrow]]]}


GetFermatPoint[tripoints_]:=Module[{totalmatrix, ee,DD,Dx,Dy},
givenTriangle =SmallFunctions`PartitionListOfPoints[tripoints,3];
ee =MainEquilateralFn[givenTriangle];
totalmatrix = Map[Function[dummy, LineMatrixEqn[dummy[[1]],dummy[[2]]]],ee];
DD=Det[Take[Map[Getdet, totalmatrix],-2]];
Dx=Det[Take[Map[Getdetx1, totalmatrix],-2]];
Dy=Det[Take[Map[Getdety2, totalmatrix],-2]];
{Dx/DD,Dy/DD}
]


End[]


Protect[Evaluate[$Context<>"*"]];


EndPackage[]
