program parallel_doex
    implicit none
    integer::num_threads=4,i,j,k
    integer,parameter::m=10, n=1000, o=100
    real,dimension(m,n)::a
    real,dimension(n,o)::b
    real,dimension(m,o)::c
    real::t1,t2,ep
    a=1.0
    b=1.0
    c=0.0
    !$ call omp_set_num_threads(num_threads)
     call CPU_TIME(t1)
     !!$omp parallel do
     do i=1,m
         do j=1,o
             do k=1,n
                 c(i,j)=c(i,j)+a(i,k)*b(k,j)
     
             enddo
         enddo
     enddo
     
     
     
     !!$omp end parallel do
     call CPU_TIME(t2)
     ep=t2-t1
     !$ ep=ep/num_threads
     print*,'time',ep
    end
    