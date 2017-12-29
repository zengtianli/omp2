!==================!$ call omp_set_num_threads(num_threads)
!==============    important
    implicit none
    integer::num_threads=16
    integer::omp_get_num_theads,omp_get_thread_num
    integer::thread_num!=0
   !$ call omp_set_num_threads(num_threads)
    print*,'number of threads',num_threads   
     !$omp parallel 
    !$omp critical
     !$ thread_num=omp_get_thread_num()
    print*,'hello',thread_num
    !$omp end critical
    !$omp end parallel 
    end
    