function [manipulability] = manipulability(jac)

    manipulability = det(transpose(jac)*jac);

end



