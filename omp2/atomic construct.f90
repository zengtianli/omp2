!atomic construct
!atomic:read,write,happens in a single step
!non-atomic:............mutiple step    
    implicit none
    integer,parameter::num_threads=4,m=12
    integer::thread_num,omp_get_thread_num
    integer::i,j,sum1=0,sum2=0
    integer,external::increment !for function
    thread_num=0
    !$ call omp_set_num_threads(num_threads)
    !$omp parallel do private(thread_num,j) shared(sum1,sum2)
    do i=0,m-1
       j=2*i-i
       !$ thread_num=omp_get_thread_num()
       !!$omp critical
       !$omp atomic
       sum1=sum1+j
       sum2=sum2+increment(thread_num,j)
       !!$omp end critical
       
    enddo
    !$omp end parallel do
    print*,"sum1=",sum1
    print*,"sum2=",sum2
    
    end
    integer function increment(thread_num,j)
    implicit none
    integer,intent(in)::thread_num, j
    
    print*,"function increment run by thread number : ",thread_num
    increment=j
    end function increment
    