implicit none
    integer::num_threads=8
    integer,parameter::m=1000
    real,parameter::pi=4.0*atan(1.0)    !
    integer::istart, iend, thread_num   !do loop iterations
    real::t1,t2,ep                      !timing varibles
    integer::i,omp_get_thread_num       !
    real::dx,x,l=90.0 !degree                   !length parameters
    real::sum1=0,sum2=0
    integer::ppt                        !points per thread
    dx=l*pi/(180*(m-1))
    ppt=(m+num_threads-1)/num_threads
    istart=1
    iend=m
    !$ call omp_set_num_threads(num_threads)
    call CPU_TIME(t1)
    !$omp parallel default (none) private(istart, iend, thread_num,i,x,sum1) shared(l,dx,ppt,sum2)
    !$ sum1=0
    !$ thread_num=omp_get_thread_num()
    !$ istart=thread_num*ppt+1
    !$ iend=min(m,thread_num*ppt+ppt)
    
    do i=istart, iend
        x=(i-1)*dx
        sum1=sum1+sin(x)*dx
    enddo
    !$omp barrier!==============catch up all threads
    !$omp critical
    sum2=sum2+sum1
    !$omp end critical
    
    !$omp single
    !$ print*,"single construct performed by thread:",thread_num
    print*,"area",sum2
    !$omp end single    !====================diagnostics 

    
    
    !$omp end parallel
    end
    