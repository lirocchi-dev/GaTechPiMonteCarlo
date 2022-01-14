classdef Dart
    %DART Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (SetAccess = private)
        X
        Y
    end
    
    methods
        function obj = Dart(xCoord, yCoord)
            %DART Construct an instance of this class
            %   Detailed explanation goes here
            obj.X = xCoord;
            obj.Y = yCoord;
        end
    end
end

