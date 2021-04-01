
% Include util and autogen folders
set_path

%   f = [q10, dq10, alpha(3-5)_q2, alpha(3-5)_q3]
%       q10: pre-impact inital angle for q1
%       dq10: pre-impact inital velocity for dq1
%       alpha(3-5)_q2:
%                   3rd to 5th Bezier coefficient for q2
%       alpha(3-5)_q3:
%                   3rd to 5th Bezier coefficient for q3
%
% Manually tuned (working):
% f = [-0.2023   -0.6612    0.4121    0.5252    0.2914    3.1016    3.0169    2.7406];
f = [ -0.0836   -0.2189    0.0174    0.1214    0.2014    3.1504    3.0905    2.8567]; %best yet
% f = [-0.0810   -0.3430   -0.2055   -0.0803    0.0941    3.2472    3.3455    3.1840];
% f = [ -0.1054   -0.3927    0.2447    0.3185    0.1570    3.1662    3.0963    3.0634];

z_tot = [];
n = 5;

q1_min = -f(1);
q1_max = f(1);

s_params = [q1_min, q1_max];

alpha2 = [-f(5)+2*f(3), -f(4)+2*f(3), f(3:5)];
alpha3 = [-f(8)+2*f(6), -f(7)+2*f(6), f(6:8)];

a = [alpha2, alpha3];

x_tot = [];
t_tot = [];

for i = 1:n
    
    % Simulation of a single step of ZD to using preimpact conditions
    %   applies impact first then simulates zero dynamics
    %
    % Inputs: f = [q10, dq10, alpha(3-5)_q2, alpha(3-5)_q3]
    %       q10: pre-impact inital angle for q1
    %       dq10: pre-impact inital velocity for dq1
    %       alpha(3-5)_q2:
    %                   3rd to 5th Bezier coefficient for q2
    %       alpha(3-5)_q3:
    %                   3rd to 5th Bezier coefficient for q3
    %
    % Outputs:
    %       t_sol - time (s) of zero dynamics
    %       z_sol - [q1, dq1] post impact dynamics
    %
    [t_sol, z_sol] = sim_zero_dynamics(f);
    
    for j = 1:length(z_sol)
        x = func_map_z_x(z_sol(j, :), a, s_params);
        x_tot = [x_tot; x];
    end
    
    f(1:2) = z_sol(end,:);
    
    z_tot = [z_tot; z_sol];
    t_tot = [t_tot; t_sol];
end

figure
plot(z_tot(1,1),z_tot(1,2),'x'), hold on
plot(z_tot(:,1),z_tot(:,2))
hold off, grid on
title('Phase portrait of q_1 vd dq_1')
xlabel('q_1 (rads)')
ylabel('dq_1 (rads/s)')
legend('Start','Trajectory')

animate_results(t_tot, x_tot);