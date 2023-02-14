#include <stdio.h>
#include <stdlib.h>

//  the adjacency matrix for each given graph
int adjacency_matrix[200][200];

/*  the function that recursively calculates all subsets of
    a given size from a set
    arr[] - the given set
    n - the size of arr[]
    clique - the size of the subsets
    data[] - temporarily stores the combinations
    index - current index in data[]
    i - current index in arr[]
*/
void all_subsets(int arr[], int n, int clique, 
                 int index, int data[], int i);

/*  the function that verifies if a given set - data[]
    forms a clique of the given size - clique
*/
void verify_kClique(int data[], int clique) {
    for(int i = 0; i < clique; i++) {
        for(int j = 0; j < clique; j++) {
            if(i != j) {
                //the condition for a missing edge
                if(adjacency_matrix[data[i]][data[j]] == 0) {
                    return;
                }
            }
        }
    }
    //the set forms a clique
    printf("True");
    exit(0);
}

//  the function that prints all the subsets for the array
void print_subsets(int arr[], int n, int clique) {
    int data[clique];
    all_subsets(arr, n, clique, 0, data, 0);
}

void all_subsets(int arr[], int n, int clique, 
                 int index, int data[], int i) {
    //verifies if the current combination forms a k-clique
    if(index == clique) {
        verify_kClique(data, clique);
        return;
    }
    //when there are no more elements to put in data
    if(i > n) {
        return;
    }
    //next location
    data[index] = arr[i];
    all_subsets(arr, n, clique, index + 1, data, i + 1);
    all_subsets(arr, n, clique, index, data, i + 1);
    
}

int main(int argc, char **argv) {
    FILE *file = fopen(argv[1], "r");
    char buffer[100];
    //reads each line from the file
    fgets(buffer, 100, file);
    //the conversion to int
    int kClique = atoi(buffer);

    fgets(buffer, 100, file);
    int nodes = atoi(buffer);
    //builds the array with all the nodes
    int arr[nodes];
    for(int i = 0; i < nodes; i++) {
        arr[i] = i + 1;
    }

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

    print_subsets(arr, nodes - 1, kClique);
    /* if the program returns from the function 
    without finding the clique of the size k */
    printf("False");
    fclose(file);    
    return 0;
}