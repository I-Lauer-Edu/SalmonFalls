function vectorout = vectordisplacement(gpsin)
% help section : Subtracts BASE trend from station residuals

vectorout = gpsin;

vectorout.horz = sqrt(vectorout.n.^2 + vectorout.e.^2);
vectorout.vert = sqrt(vectorout.u.^2);
vectorout.t = sqrt(vectorout.n.^2 + vectorout.e.^2 + vectorout.u.^2);


%MUST have a return value ending function
return