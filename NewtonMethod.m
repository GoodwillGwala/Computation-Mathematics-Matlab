% Author: Goodwill Gwala
% Date: 15/03/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Details: Newton method for system of linear equations %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function roots = Newtonmethodsystem(F,J,x0,tol)
    iterations = 1;
    for row=1:3
        for col=1:3
            J_sub(row,col) = J{row,col}(x0(1,1), x0(2,1),x0(3,1));
        end
            F_sub(row,1) = F{row}(x0(1,1),x0(2,1),x0(3,1));
    end

    J_sub = inv(J_sub);
    x0 = x0 - J_sub*F_sub;
    while(1)
        for row=1:3
            for col=1:3
                J_sub(row,col) = J{row,col}(x0(1,1), x0(2,1),x0(3,1));
            end
            F_sub(row,1) = F{row}(x0(1,1),x0(2,1),x0(3,1));
        end

        J_sub = inv(J_sub);
        roots = x0 - J_sub*F_sub;
        iterations = iterations+1;

        %find error of all systems stop if all are less then tol
        error_1 = abs(roots(1)-x0(1))/abs(roots(1));
        error_2 = abs(roots(2)-x0(2))/abs(roots(2));
        error_3 = abs(roots(3)-x0(3))/abs(roots(3));
        if (error_1<tol) && (error_2<tol) && (error_3<tol)
            break
        end
        x0 = roots;
    end
end
