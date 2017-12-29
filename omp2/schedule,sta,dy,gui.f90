!program to yuse schedule clause
!static: chunk size=constant, mapping=constant
!dynamic: chunk size=constant mapping=dynamic    
!guided: chunk size, mapping =dynamic    
    implicit none
    integer,parameter::num_threads=4, m=12
    integer::thread_num
    integer::i,omp_get_thread_num
    
    thread_num=0
    !$ call omp_set_num_threads(num_threads)
    !====================================================
    !(static,2) chunk size =2 
    !dynmaic: one or two threads handle more works others idle ,2 means at least chunk size 2
    !with large iterations more uniform threads be used
    !==================================
    !$omp parallel do private(thread_num) schedule(guided,5)!(dynamic,5)!(static,2) 
    
    do i=0,m-1
    !$ thread_num=omp_get_thread_num()
        print*,"iteration",i,"done by thread", thread_num
    enddo
    !$omp end parallel do 
    end
    