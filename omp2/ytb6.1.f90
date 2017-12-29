implicit none
    integer::num_threads=4
    integer,parameter::m=100000
    real,dimension(m)::a
    real,parameter::pi=4.0*atan(1.0)    !
    integer::istart, iend, thread_num   !do loop iterations
    real::t1,t2,ep                      !timing varibles
    integer::i,omp_get_thread_num       !
    real::dx,l=10.0,x                   !length parameters
    integer::ppt                        !points per thread
    dx=l/(m-1)
    ppt=(m+num_threads-1)/num_threads
    istart=1
    iend=m
    !$ call omp_set_num_threads(num_threads)
    call CPU_TIME(t1)
    !$omp parallel default (none) private(istart, iend, thread_num,i,x) shared(l,dx,a,ppt)
    
    !$ thread_num=omp_get_thread_num()
    !$ istart=thread_num*ppt+1
    !$ iend=min(m,thread_num*ppt+ppt)
    do i=istart, iend
        x=(i-1)*dx
        a(i)=(sin(2*pi*x/l))**2+(cos(2*pi*x/l))**2
    enddo
    !$omp critical
    !$ print*,"thread_num=",thread_num,"istart=",istart,"iend=",iend
    !$omp end critical
    !$omp end parallel
    
    call cpu_time(t2)
    ep=t2-t1
    !$ ep=ep/num_threads
    !$ print*,"openmp"
    !print*,"value of a",a
    print*,"time is",ep
    end
    