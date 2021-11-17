classdef HypergeometricDistribution
    %UNTITLED8 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        M
        K
        N
        mean
        var
        
    end
    
    methods
        function obj = HypergeometricDistribution(M,K,N)
            %HypergeometricDistribution: Construct an instance of this class
            %   Detailed explanation goes here
            
            obj.M=M;
            obj.K=K;
            obj.N=N;
            
            obj.mean=obj.N*(obj.K/obj.M);
            obj.var=(obj.mean)*((obj.M-obj.K)/obj.M)*((obj.M-obj.N)/(obj.M-1));
        end
        
        function y = pdf(obj,x)
            % pdf: Compute the probability mass function for the
            % hypergeometric distribution.
            
            % Detailed explanation goes here
            y=hygepdf(x,obj.M,obj.K,obj.N);
        end
        
        function y = cdf(obj,x,varargin)
            % cdf: Evaluate the cumulative distribution for the
            % hypergeometric distribution.
            
            % Detailed explanation goes here
            y=hygecdf(x,obj.M,obj.K,obj.N,varargin{:});
            
        end
        
        function y = inv(obj,P)
            % inv: compute the inverse cdf for the hypergeometric function. 
            %   Detailed explanation goes here
            y=hygeinv(P,obj.M,obj.K,obj.N);
        end
        
        function R = random(obj,varargin)
            % random: randomly generate hypergeometrically distributed numbers.
            % Detailed explanation goes here
            R=hygernd(obj.M,obj.K,obj.N,varargin{:});
        end
    end
end

