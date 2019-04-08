% RomeoJuliet.m
% In this m-file, we simulate the system of difference equations from
% Section 2.3.1 or the book
%
%  R_n+1 = a_R R_n + p_R J_n
%  J_n+1 = a_J J_n + p_J R_n
%
Nsteps = 100;
Rvec = zeros(Nsteps,1);
Jvec = zeros(Nsteps,1);
params = input(' Enter [a_R, a_J, p_R, p_J] within square brackets: ');
Rvec(1) = 1;
Jvec(1) = 1;
for i=1:Nsteps-1
    Rvec(i+1) = params(1)*Rvec(i) + params(3)*Jvec(i);
    Jvec(i+1) = params(2)*Jvec(i) + params(4)*Rvec(i);
end
figure(1)
subplot(121)
  plot([1:Nsteps],Rvec,'o-',[1:Nsteps],Jvec,'.-')
  xlabel('n'), ylabel('R_n, J_n')
  legend('Romeo Love','Juliet Love')
subplot(122)
  plot(Rvec,Jvec,'o-')
  xlabel('R_n'), ylabel('J_n')
  title('phase plane plot')