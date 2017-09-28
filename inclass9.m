% Inclass assignment 9

% The accession number for human NOTCH1 mRNA is AF308602
% 1. Read the information from this entry into matlab
accession='AF308602';
gb_data=getgenbank(accession)

% 2. Write code that runs a blast query on the first 500 base pairs of this
% gene against the refseq_rna database
seq_begin=gb_data.Sequence(1:500);
[requestID, requestTime]=blastncbi(seq_begin,'blastn','Database','refseq_rna');
blast_data=getblast(requestID,'WaitTime',requestTime)

% 3. Find the three highest scoring hits from other species and identify
% the length of the alignment and fraction of matches/mismatches. 
blast_data.Hits(2).HSPs.Score;
blast_data.Hits(2).HSPs.Identities;
blast_data.Hits(6).HSPs.Score;
blast_data.Hits(6).HSPs.Identities;
blast_data.Hits(7).HSPs.Score;
blast_data.Hits(7).HSPs.Identities;

888;Pan troglodytes notch 1 (NOTCH1), transcript variant X4 :497;99
848;Rhinopithecus bieti notch 1 (NOTCH1), mRNA :488;98
839;Cercocebus atys notch 1 (NOTCH1), mRNA : 486;97
% 4. Run the same query against the database est_human. Comment on the
% sequences that you find. 
[requestID, requestTime]=blastncbi(seq_begin,'blastn','Database','est_human');
blast_data=getblast(requestID,'WaitTime',requestTime)

% In the query result, I found 50 hits. Only 1 with a high score and high length, while others are very short. 
% Blast function was still trying to align those short genes with the first 500bps of the original sequence. 
