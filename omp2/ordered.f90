implicit none
    integer,parameter::num_thread=4,n=8
    integer,dimension(0:n-1)::a=0
    integer::thread_num=0,i,omp_get_thread_num
    
    !$ call omp_set_num_threads(num_thread)
    
    !$omp parallel do default(none) ordered schedule(dynamic) private(thread_num,i) shared(a)
    do i=0,n-1
    !$ thread_num=omp_get_thread_num()
        !$omp ordered
        print'("threadnumber ",i2," updated a [",i2,"]")',thread_num,i
        a(i)=a(i)+i
        !$omp end ordered
        !=====================
        !this order clause can guarantee later order 
       ! !$omp ordered
        print'("thread number",i2,"  prints the value of a [",i2,"]=", i2)',thread_num, i,a(i)
       ! !$omp end ordered
    enddo
    !$omp end parallel do
    
    
    end
    