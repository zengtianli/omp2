implicit none
integer,parameter::num_threads=4
integer::thread_num,omp_get_thread_num
integer::i

!$ call omp_set_num_threads(num_threads)
!thread_num=12    

 !   print*,"before thread value=",thread_num
 !   !$omp parallel private(thread_num)
 !   print*,"inside thread value=",thread_num
 !   !$ thread_num=omp_get_thread_num()
 !   !$ print*,"active thread:",thread_num
 !   !$ thread_num=thread_num+100
 !   !$ print*,"thread=",omp_get_thread_num(),"threadvalue=",thread_num
 !   !$omp end parallel
 !   print*,"after thread value=",thread_num
!======================================================
! private variables are auto-initialized before usage
!======================================================
    
!thread_num=12    
!    print*,"before firstprivate thread value=",thread_num
!    !$omp parallel firstprivate(thread_num)
!    print*,"inside thread value=",thread_num
!    !$ thread_num=omp_get_thread_num()
!    !$ print*,"active thread:",thread_num
!    !$ thread_num=thread_num+100
!    !$ print*,"thread=",omp_get_thread_num(),"threadvalue=",thread_num
!    !$omp end parallel
!    print*,"after fistprivate thread value=",thread_num
!======================================================
! firstprivate variables must be initialized before usage or garbage values used
!======================================================
 thread_num=24
    print*,"before lastprivate thread value=",thread_num
   ! !$omp parallel do lastprivate(thread_num)
    !$omp parallel do lastprivate(thread_num) ordered
!======================================================
!this order clause is important,without it won't work     
!======================================================    
    
    do i=1,12
    !$omp ordered 
    !!$omp critical 
        
    !$ thread_num=omp_get_thread_num()+100+i
    !$ print*,"i=",i,"thread=",omp_get_thread_num(),"threadvalue=",thread_num
        
    !!$omp end critical 
    !$omp end ordered 

    enddo
    
    !$omp end parallel do
    print*,"after lastprivate thread value=",thread_num
!======================================================
! private variables will be auto-initialized to 0 before usage
    
! critical: run erially inside a parallel regime not preserve the thread order   
    
! ordered: run serially inside a parallel regime and preserve the thread order excuted by having an ordered directive   
!======================================================
    
    
    
    end
    