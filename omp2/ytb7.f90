!openmp section
implicit none
    integer::num_threads=8
    real::t1,t2,ep
    integer::thread_num,omp_get_thread_num
    integer,parameter::m=100,n=100
    integer::i,j,k
    real,dimension(m,n)::a,b,c,d,e
    a=1.0
    b=0.0
    c=0.0
    d=0.0
    e=0.0
    !$ call omp_set_num_threads(num_threads)
    call CPU_TIME(t1)
!$omp parallel
!====================================
!because of race condition, i,j threadnum will be changed by threads, so make it private means they won't interfere others ij
! don't need put b,c,d as private because they all are calculated as one thread    
!$omp sections private(i,j,thread_num)!
    
    !$omp section
    !$ thread_num=omp_get_thread_num()
    !$ print*,"section 1:mat_ started by thread number:",thread_num
    do k=1,m
    do j=1,n
        do i=1,m
            b(i,j)=a(i,k)*a(k,j)
        enddo
    enddo
    enddo
    
    !$ print*,"section 1:mat_ finished by thread number:",thread_num
    
    !$omp section
    !$ thread_num=omp_get_thread_num()
    !$ print*,"section 2:mat_ started by thread number:",thread_num
    do j=1,n
        do i=1,m
            b(i,j)=a(i,j)*4*(i+j)
        enddo
    enddo    
    !$ print*,"section 2:mat_ finished by thread number:",thread_num
    
    !$omp section
    !$ thread_num=omp_get_thread_num()
    !$ print*,"section 3:mat_ started by thread number:",thread_num
    do j=1,n
        do i=1,m
            b(i,j)=a(i,j)**2
        enddo
    enddo    
    !$ print*,"section 3:mat_ finished by thread number:",thread_num
    
    !$omp section
    !$ thread_num=omp_get_thread_num()
    !$ print*,"section 4:mat_ started by thread number:",thread_num
    do j=1,n
        do i=1,m
            b(i,j)=a(i,j)*4
        enddo
    enddo    
    !$ print*,"section 4:mat_ finished by thread number:",thread_num
    
!$omp end sections
!$omp end parallel
    call CPU_TIME(t2)
    ep=t2-t1
    !$ ep=ep/num_threads
    print*,'time',ep
    
    end
    