#include <stdio.h>
#include <stdlib.h>

//  the adjacency matrix for each given graph
int adjacency_matrix[200][200];

int main(int argc, char **argv) {
    FILE *file = fopen(argv[1], "r");
    char buffer[100];

    fgets(buffer, 100, file);
    int kClique = atoi(buffer);

    fgets(buffer, 100, file);
    int nodes = atoi(buffer);

    fgets(buffer, 100, file);
    int edges = atoi(buffer);

    for(int i = 0; i < edges; i++) {
        int node1, node2;
        fscanf(file, "%s", buffer);
        node1 = atoi(buffer);
        fscanf(file, "%s", buffer);
        node2 = atoi(buffer);
        //builds the adjacency matrix
        adjacency_matrix[node1][node2] = 1;
        adjacency_matrix[node2][node1] = 1;
    }

    //the first set of clauses
    for(int i = 1; i <= kClique; i++) {
        if(i == 1) {
            printf("(");
        }
        else {
            printf(" ^ (");
        }
        for(int j = 1; j < nodes; j++) {
            printf("x%d%d V ", j, i);
        }
        printf("x%d%d)", nodes, i);
    }

    //the second set of clauses
    for(int k = 1; k <= nodes; k++) {
        for(int i = 1; i < kClique; i++) {
            printf(" ^ ");
            for(int j = i + 1; j < kClique; j++) {
                printf("(~x%d%d V ~x%d%d) ^ ", k, i, k, j);
            }
            printf("(~x%d%d V ~x%d%d)", k, i, k, kClique);
        }
    }

    //the third set of clauses
    for(int i = 1; i <= kClique; i++) {
        for(int j = 1; j <= kClique; j++) {
            if(i != j) {
                for(int k = 1; k < nodes; k++) {
                    for(int l = k + 1; l <= nodes; l++) {
                        if(adjacency_matrix[k][l] == 0) {
                            printf(" ^ (~x%d%d V ~x%d%d)", k, i, l, j);
                        }
                    }
                }
            }  
        }
    }

    fclose(file);    
    return 0;
}