﻿using System;

namespace ModernKeePass.Services
{
    public abstract class SingletonServiceBase<T> where T : new()
    {
        protected SingletonServiceBase() { }

        private static readonly Lazy<T> LazyInstance =
            new Lazy<T>(() => new T());

        public static T Instance => LazyInstance.Value;
    }
}
