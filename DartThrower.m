classdef DartThrower
    %DARTTHROWER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (SetAccess = private)
        SeedValue (1,1) {mustBePositive, mustBeInteger} = 1;
    end

    properties (Access = private)

        rng
        
    end
    
    methods
        function obj = DartThrower(seedValue)
            %DARTTHROWER Construct an instance of this class
            %   Detailed explanation goes here
            obj.SeedValue = seedValue;
            obj.rng = RandStream.create("mt19937ar","Seed",obj.SeedValue);
        end
        
        function output = ThrowDart(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            output = Dart(rand(obj.rng), rand(obj.rng));
        end
    end
end

