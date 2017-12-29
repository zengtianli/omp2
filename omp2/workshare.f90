implicit none
    integer::num_threads=4
    integer,parameter::m=1000000
    real,dimension(m)::a,b,c
    real::t1,t2,ep
    a=0
    b=0
    c=0
    !$ call omp_set_num_threads(num_threads)
    call CPU_TIME(t1)
    !!$omp parallel workshare
    !!$omp parallel
    !$omp workshare
    a=(9.0)**2                        !============================================
    b=(1.0)**2                        !similar to section, but section will have race condition
    c=a+b                             !
    !workshare:: 1, like section, everycommand excuted by one thread. 2,everycommand have barrier avoid race conditon like section

    !$omp end workshare
    !!$omp end parallel
    !!$omp end parallel workshare
    call CPU_TIME(t2)
    ep=t2-t1
    !$ ep=ep/num_threads
    !$ print*, "openmp"
    print*,"value for a",sum(a)/(m*81.0)
    print*,"value for b",sum(b)/(m)
    print*,"value for c",sum(c)/(m*82.0)
    print*,"time",ep
    
    end
    