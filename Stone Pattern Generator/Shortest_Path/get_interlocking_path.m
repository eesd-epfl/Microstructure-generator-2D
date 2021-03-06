function [ interlocking ] = get_interlocking_path( optimal_path , int_type )
% GET_INTERLOCKING_PATH gives the interlocking of a path (length/delta_H)
%
% %%%%%% usage %%%%%%
% 
% %% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - optimal_path      : The optimal path (two columns, xy)
%
% %% OUTPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - interlocking : The interlocking (L_shortestpath/heigth)
%
%
% %% AUTEUR : Martin HOFMANN
% %% DATE   : FEBRUARY 2016
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

leng=0; % Length initializing
% We iterate on all the coordinates of the path
for i=1:(size(optimal_path,1)-1)
    leng=leng+distanz(optimal_path(i,:),optimal_path(i+1,:));
end
if exist('int_type','var')
deltaH=norm(optimal_path(1,:)-optimal_path(end,:),2);%max(optimal_path(:,2))-min(optimal_path(:,2));
else
% Difference between the highest and lowest point
deltaH=max(optimal_path(:,2))-min(optimal_path(:,2));
end
% Computation of the interlocking
interlocking=leng/deltaH;


end
