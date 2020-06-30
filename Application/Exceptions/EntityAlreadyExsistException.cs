using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Exceptions
{
    public class EntityAlreadyExistsException : Exception
    {
        public EntityAlreadyExistsException(int id, Type type)
            : base($"Entity of type {type.Name} with an id of {id} already exists.")
        {

        }
    }
}

