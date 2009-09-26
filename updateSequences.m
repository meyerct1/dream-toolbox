function [sequences, wasLastPointStored] = updateSequences(dreamPar, sequences, acceptedChild, iOffspring, iteration)

wasLastPointStored = true;
if ~dreamPar.reducedSampleCollection
%     rNumber = size(sequences,1)-dreamPar.nOffspringPerSeq + iOffspring;  
    rNumber = iteration;
    for seq = 1:dreamPar.nSeq 
        sequences(rNumber,:,seq) = acceptedChild(seq, :);
    end
else
%     rNumber = size(sequences,1)- floor((mod(iteration-iOffspring,dreamPar.reducedSampleFrequency)+ dreamPar.nOffspringPerSeq)/dreamPar.reducedSampleFrequency) + ...
%         floor((mod(iteration-iOffspring,dreamPar.reducedSampleFrequency)+
%         iOffspring)/dreamPar.reducedSampleFrequency); 
    if mod(iteration, dreamPar.reducedSampleFrequency) == 0
        rNumber = iteration/dreamPar.reducedSampleFrequency;
        for seq = 1:dreamPar.nSeq 
            sequences(rNumber,:,seq) = acceptedChild(seq, :);
        end
    else 
        wasLastPointStored = false;
    end
end