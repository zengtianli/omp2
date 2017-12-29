!master save to github
    implicit none
    integer,parameter::num_threads=8
    integer,parameter::n=24
    integer::i,omp_get_thread_num
    real::a=100.0
    real,dimension(n)::b
    integer::istart, iend, thread_num
    integer::ppt
    ppt=(n+num_threads-1)/num_threads
    istart=1
    iend=n
    !$ call omp_set_num_threads(num_threads)
    !$omp parallel shared(a,ppt,b) private(i,istart,iend,thread_num)
    !$omp master
      !$ thread_num=omp_get_thread_num()
      !$ print*, "master block done by: ",thread_num
      !$ a=real(thread_num)+200.0
    !$omp end master
    
    !$omp barrier
    
    !$ thread_num=omp_get_thread_num()
    !$ istart=thread_num*ppt+1
    !$ iend=min(n,thread_num*ppt+ppt)
    
    !$ print*,"thread_num=", thread_num,"istart=",istart,"iend=",iend
    do i=istart,iend
    b(i)=a
    enddo
    
    
    !$omp end parallel
    print*,"serial value of a=100.0"
    !$ print*,"parallel value of a=200"
    do i=1,n
    print'("array b (",i2,")=",f15.6)',i,b(i)
      !  print'("aa,   (",i2,")   ",f15.6)',i,b(i)
    enddo
    
    
    end
    