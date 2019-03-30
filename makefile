CFLAGS += -O3 -g3  -W
LIBS += -lm -pthread
CC = gcc

compute_int:  main.o
	$(CC) $(CFLAGS) main.o  -o compute_int $(LIBS)

main.o: main.c
	$(CC) $(CFLAGS) -c main.c 



clean:
	rm  -rf *.o compute_int

mem_check: compute_int
	valgrind --leak-check=yes --leak-check=full --show-leak-kinds=all -v ./compute_int 1000

time_check: compute_int
	time --verbose ./compute_int $(threads_num)

