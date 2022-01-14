classdef DartBoard < handle
    %DARTBOARD Summary of this class goes here
    %   Detailed explanation goes here
    

    properties (Access = private, Constant)

        circAngles = [0:.1:2*pi, 0];
        squareCoords = [0 0;0 1;1 1;1 0;0 0]
        circCoords = [(.5+.5.*cos([0:.1:2*pi, 0]))',(.5+.5.*sin([0:.1:2*pi, 0]))']

    end

    properties (Access = private)
        figHandle
        axesHandle
        
    end

    properties (SetAccess = private)

            DartsInCircle = 0;
            DartsOutsideCircle = 0;

    end
    
    methods
        function obj = DartBoard(varargin)
            
            switch nargin

                case 0
            obj.figHandle = uifigure();
            obj.axesHandle = uiaxes(obj.figHandle,...
                "Units","normalized",...
                "Position",[.05 .05 .9 .9],...
                "XLim", [0 1],...
                "YLim", [0 1],...
                "XTick", [],...
                "YTick", [],...
                "XColor","none",...
                "YColor", "none",...
                "PlotBoxAspectRatioMode","manual",...
                "PlotBoxAspectRatioMode","manual",...
                "PlotBoxAspectRatio",[1 1 1]);

                case 1
                    obj.axesHandle = varargin{1};
                    obj.axesHandle.XLim = [0 1];
                    obj.axesHandle.YLim = [0 1];
                    obj.axesHandle.XTick = [];
                    obj.axesHandle.YTick = [];
                    obj.axesHandle.XColor = "none";
                    obj.axesHandle.YColor = "none";
                    obj.axesHandle.PlotBoxAspectRatioMode = "manual";
                    obj.axesHandle.PlotBoxAspectRatio = [1 1 1];

            end



            obj.drawBoard();
        end
        
        function AddDart(obj,dartObj)

            if inpolygon(dartObj.X,dartObj.Y,...
                    obj.circCoords(:,1), obj.circCoords(:,2))
                obj.DartsInCircle = obj.DartsInCircle + 1;
                dColor = "b";
            else
                obj.DartsOutsideCircle = obj.DartsOutsideCircle + 1;
            dColor = "r";
            end
            plot(obj.axesHandle, dartObj.X, dartObj.Y,...
                "Color",dColor,"LineStyle", "none",...
                "Marker", "o")

        end

        function ClearBoard(obj)

            obj.DartsInCircle = 0;
            obj.DartsOutsideCircle = 0;
            obj.axesHandle.NextPlot = "replace";
            obj.drawBoard;

        end

        function Close(obj)

            close(obj.figHandle)

        end

    end

    methods (Access = private)

        function drawBoard(obj)

            plot(obj.axesHandle,...
                obj.squareCoords(:,1), obj.squareCoords(:,2),...
                "Color","k")

            obj.axesHandle.NextPlot = "add";

            plot(obj.axesHandle,...
                obj.circCoords(:,1),obj.circCoords(:,2),...
                "Color","k");

            

        end


    end
end

