function inf=mdi(A,B,C,ui,oi);
% MDI Calculates Modal Dominance Indices
%
% inf=mdi(A,B,C,ui,oi) or mdi(num,den), returns an information
% matrix with four columns containing
% eigenvalues (poles), residues, MDI, MDI% and MDI%-accumulated
% The entries of this matrix are ordered in decreasing
% order of the absolute values of the MDI's
% In the case of multivariable systems ui and oi
% indicate the input-output path being considered
% These entries may be omitted in the SISO case
% In the case of pairs of complex eigenvalues (poles), the MDI
% are identical and equal to the summation of the respective
% values returned in the second column of inf.

% The MDI's have been defined in the paper
%
% Quantitative Measure of Modal Dominance for
% Continuous Systems, by Luis A. Aguirre
% Proc. of the 32nd IEEE CDC, San Antonio, Texas
% December 1993, pp. 2405-2410.
%
% The equation numbers referred to correspond to
% the aforementioned paper

narg=nargin;

if narg == 2
  % transfer function

  [r,p,k]=residue(A,B);
  for i=1:length(r);
    if imag(r(i)) ~= 0,
      % if complex mode (implements equation 5)
      gamma(i)=-((r(i)*conj(p(i))+conj(r(i))*p(i))/(2*p(i)*conj(p(i))));
    else
      % if real mode (implements equation 4)
      gamma(i)=-r(i)/p(i);
    end;
  end;


elseif narg > 2
  % state space

  if narg == 5
    % multivariable system
    B=B(:,ui);
    C=C(oi,:);
  end

  [v p]=eig(A);
  p=diag(p);

  % represent system in modal coordinates
  A_bar=inv(v)*A*v;
  B_bar=inv(v)*B;
  C_bar=C*v;

  C_hat=diag(C_bar);
  B_hat=diag(B_bar);

  % implements equation 19 for the only input-output
  % path being considered
  sigma=-(real(C_hat*B_hat*inv(A_bar)));
  gamma=diag(sigma);

end

% Initializations
comec=1;

% If the model has an integrator or unstable
% pole, the respective mode is not taken into account
%
% If model has more than one integrator or more
% than one unstable pole this should be altered
%
if max(p)>=0,
  comec=2;
end;

% put poles in order of dominance
% using the absolute value of the MDI's

dd=abs(gamma);
for i=comec:length(gamma)
  D(i)=max(dd);

  % search for the index of the remaining largest
  for k=1:length(dd)
    if dd(k) == max(dd),
       index=k;
    end;
  end;
  Da(i)=gamma(index);
  dd(index)=0;
  P(i)=p(index);
  R(i)=r(index);
end;
D=D*100/sum(D);
AD(1)=D(1);
for i=2:length(D)
  AD(i)=AD(i-1)+D(i);
end;
inf=[P' R' Da' D' AD'];

